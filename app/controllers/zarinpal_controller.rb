class ZarinpalController < ActionController::Base
    # Author : Alireza Josheghani #
    # WebSite : http://ipenpal.ir #
    # Version : 1.0 For ZarinPal #
    def pay
        if !params['amount'].blank?
            if params['amount'].to_i > 99
                client = Savon.client(
                    wsdl: "https://de.zarinpal.com/pg/services/WebGate/wsdl")
                response = client.call(:payment_request, message: {
                    "MerchantID" => "5599b1a0-dfb0-11e6-a851-005056a205be", # ای پی آی درگاه زرین پال شما
                    "Amount" => params['amount'], # مبلغ پرداختی
                    "Description" => "درگاه خطابه غدیر و فدک",
                    "Email" => "amvaleh@gmail.com",
                    "Mobile" => "09353954916",
                    "CallbackURL" => "http://localhost:3000/zarinpal/verify" # صفحه بازگشت از درگاه
                })
                results = response.body
                authority = results[:payment_request_response][:authority].sub(/^[0:]*/,"")
                # to be removed
                # if params[:mobile_number].present? and Person.where(mobile_number: params[:mobile_number]).any?
                #   person = Person.find_by_mobile_number(params[:mobile_number])
                #   payment = person.payments.wating.last
                #   byebug
                #   payment.uid = authority
                #   payment.save
                # save in person's payments the authority code
                if params[:person_id].present? and Person.where(id: params[:person_id]).any?
                  person = Person.find(params[:person_id])
                  payment = person.payments.wating.last
                  payment.uid = authority
                  payment.save
                else
                  payment = Payment.create do |p|
                    p.amount = params['amount'].to_s
                    p.uid = authority
                    p.payment_status = PaymentStatus.find_by_name("wating")
                  end
                end
                #
                status = results[:payment_request_response][:status]
                if status.to_i < 100
                    render :text => "Some Thing's wrrong"
                else
                    session[:AMOUNT] = params['amount'] # ذخیره ی موقف مبلغ در سشن
                    redirect_to "https://www.zarinpal.com/pg/StartPay/#{authority}"
                end
            else
                render :text => "مبلغ نا معتبر است"
            end
        else
            render :text => "مبلغ را وارد کنید"
        end
    end
    def verify
        if !params['Authority'].blank?
            client = Savon.client(wsdl: "https://de.zarinpal.com/pg/services/WebGate/wsdl")
            response = client.call(:payment_verification, message: {
                "MerchantID" => "5599b1a0-dfb0-11e6-a851-005056a205be", # ای پی آی درگاه زرین پال شما
                "Amount" => session[:AMOUNT], # مبلغ پرداختی که در سشن قرارداده شده بود
                "Authority" => params['Authority']
            })
            session.delete(:AMOUNT)
            results = response.body
            status = results[:payment_verification_response][:status]
            ref_id = results[:payment_verification_response][:ref_id]
            authority = params[:Authority].sub(/^[0:]*/,"") # removing leading zeros coming from paypal
            if status.to_i < 100
                if Payment.where(:uid => authority , :person_id => nil).any?
                  # delete no person payment with authority
                  payment = Payment.find_by_uid(authority)
                  reminder = payment.reminder
                  reminder.destroy
                  payment.destroy
                elsif Payment.where(:uid=>authority).any?
                  #  revert payment uid
                  payment = Payment.find_by_uid(authority)
                  payment.uid = ""
                  payment.save
                end
                redirect_to root_path , :alert => "تراکنش از طرف کاربر متوقف شد"
            else
                if Payment.where(:uid => authority).any?
                  # this payment is recognized, updating it:
                  # TO DO: compare this amount with wating and ignored amount and update them.
                  #
                  payment = Payment.find_by_uid(authority)
                  payment.payment_status = PaymentStatus.find_by_name("done") # sending Regards to user and setting next turn payment
                  payment.save
                end
                redirect_to root_path , :notice => "تراکنش با موفقیت انجام شد . کد پیگیری : #{ref_id}"
            end
        else
            redirect_to root_path , :alert => "خطای امنیتی."
        end
    end
end
