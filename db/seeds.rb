# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
PaymentStatus.create!(name: 'wating')
PaymentStatus.create!(name: 'done')
PaymentStatus.create!(name: 'ignored')
SmsStatus.create!(name: 'wating')
SmsStatus.create!(name: 'sent')
Gender.create!(name: 'آقا')
Gender.create!(name: 'خانم')
City.create!(name: 'ازنا' , state: 'لرستان')
City.create!(name: 'مهريز' , state: 'یزد')
City.create!(name: 'مِيبُد' , state: 'یزد')
City.create!(name: 'يزد' , state: 'یزد')
City.create!(name: 'اليگودرز' , state: 'لرستان')
City.create!(name: 'بروجرد' , state: 'لرستان')
City.create!(name: 'پل‌دختر' , state: 'لرستان')
City.create!(name: 'خرم‌آباد' , state: 'لرستان')
City.create!(name: 'دورود' , state: 'لرستان')
City.create!(name: 'دلفان' , state: 'لرستان')
City.create!(name: 'آذرشهر' , state: 'آذربایجان شرقی')
City.create!(name: 'اسکو' , state: 'آذربایجان شرقی')
City.create!(name: 'اهر' , state: 'آذربایجان شرقی')
City.create!(name: 'بستان‌آباد' , state: 'آذربایجان شرقی')
City.create!(name: 'بناب' , state: 'آذربایجان شرقی')
City.create!(name: 'تبریز' , state: 'آذربایجان شرقی')
City.create!(name: 'جلفا' , state: 'آذربایجان شرقی')
City.create!(name: 'چاراویماق' , state: 'آذربایجان شرقی')
City.create!(name: 'سراب' , state: 'آذربایجان شرقی')
City.create!(name: 'شبستر' , state: 'آذربایجان شرقی')
City.create!(name: 'عجب‌شیر' , state: 'آذربایجان شرقی')
City.create!(name: 'کلیبر' , state: 'آذربایجان شرقی')
City.create!(name: 'مراغه' , state: 'آذربایجان شرقی')
City.create!(name: 'مرند' , state: 'آذربایجان شرقی')
City.create!(name: 'ملکان' , state: 'آذربایجان شرقی')
City.create!(name: 'میانه' , state: 'آذربایجان شرقی')
City.create!(name: 'ورزقان' , state: 'آذربایجان شرقی')
City.create!(name: 'هریس' , state: 'آذربایجان شرقی')
City.create!(name: 'هشترود' , state: 'آذربایجان شرقی')
City.create!(name: 'ارومیه' , state: 'آذربایجان غربی')
City.create!(name: 'اشنویه' , state: 'آذربایجان غربی')
City.create!(name: ' بوکان' , state: 'آذربایجان غربی')
City.create!(name: ' پیرانشهر' , state: 'آذربایجان غربی')
City.create!(name: ' تکاب' , state: 'آذربایجان غربی')
City.create!(name: ' چالدران' , state: 'آذربایجان غربی')
City.create!(name: ' خوی' , state: 'آذربایجان غربی')
City.create!(name: ' سردشت' , state: 'آذربایجان غربی')
City.create!(name: ' سلماس' , state: 'آذربایجان غربی')
City.create!(name: ' شاهین‌دژ' , state: 'آذربایجان غربی')
City.create!(name: ' ماکو' , state: 'آذربایجان غربی')
City.create!(name: ' مهاباد' , state: 'آذربایجان غربی')
City.create!(name: ' میاندوآب' , state: 'آذربایجان غربی')
City.create!(name: ' نقده' , state: 'آذربایجان غربی')
City.create!(name: 'اردبیل' , state: 'اردبیل')
City.create!(name: 'بیله‌سوار' , state: 'اردبیل')
City.create!(name: 'پارس‌آباد' , state: 'اردبیل')
City.create!(name: 'خلخال' , state: 'اردبیل')
City.create!(name: 'کوثر' , state: 'اردبیل')
City.create!(name: 'گِرمی' , state: 'اردبیل')
City.create!(name: 'مِشگین‌شهر' , state: 'اردبیل')
City.create!(name: 'نَمین' , state: 'اردبیل')
City.create!(name: 'نیر' , state: 'اردبیل')
City.create!(name: 'آران و بیدگل' , state: 'اصفهان')
City.create!(name: 'اردستان' , state: 'اصفهان')
City.create!(name: 'اصفهان' , state: 'اصفهان')
City.create!(name: 'برخوار و میمه' , state: 'اصفهان')
City.create!(name: 'تیران و کرون' , state: 'اصفهان')
City.create!(name: 'چادگان' , state: 'اصفهان')
City.create!(name: 'خمینی‌شهر' , state: 'اصفهان')
City.create!(name: 'خوانسار' , state: 'اصفهان')
City.create!(name: 'سمیرم' , state: 'اصفهان')
City.create!(name: 'شهرضا' , state: 'اصفهان')
City.create!(name: 'سمیرم سفلی' , state: 'اصفهان')
City.create!(name: 'فریدن' , state: 'اصفهان')
City.create!(name: 'فریدون‌شهر' , state: 'اصفهان')
City.create!(name: 'فلاورجان' , state: 'اصفهان')
City.create!(name: 'کاشان' , state: 'اصفهان')
City.create!(name: 'گلپایگان' , state: 'اصفهان')
City.create!(name: 'لنجان' , state: 'اصفهان')
City.create!(name: 'مبارکه' , state: 'اصفهان')
City.create!(name: 'نائین' , state: 'اصفهان')
City.create!(name: 'نجف‌آباد' , state: 'اصفهان')
City.create!(name: 'نطنز' , state: 'اصفهان')
City.create!(name: 'آبدانان' , state: 'ایلام')
City.create!(name: 'ایلام' , state: 'ایلام')
City.create!(name: 'ایوان' , state: 'ایلام')
City.create!(name: 'دره‌شهر' , state: 'ایلام')
City.create!(name: 'دهلران' , state: 'ایلام')
City.create!(name: 'شیروان و چرداول' , state: 'ایلام')
City.create!(name: 'مهران' , state: 'ایلام')
City.create!(name: 'بوشهر' , state: 'بوشهر')
City.create!(name: 'تنگستان' , state: 'بوشهر')
City.create!(name: 'جم' , state: 'بوشهر')
City.create!(name: 'دشتستان' , state: 'بوشهر')
City.create!(name: 'دشتی' , state: 'بوشهر')
City.create!(name: 'دیر' , state: 'بوشهر')
City.create!(name: 'دیلم' , state: 'بوشهر')
City.create!(name: 'کنگان' , state: 'بوشهر')
City.create!(name: 'گناوه' , state: 'بوشهر')
City.create!(name: 'اسلام‌شهر' , state: 'تهران')
City.create!(name: 'پاکدشت' , state: 'تهران')
City.create!(name: 'تهران' , state: 'تهران')
City.create!(name: 'دماوند' , state: 'تهران')
City.create!(name: 'رباط‌کریم' , state: 'تهران')
City.create!(name: 'ری' , state: 'تهران')
City.create!(name: 'ساوجبلاغ' , state: 'تهران')
City.create!(name: 'شمیرانات' , state: 'تهران')
City.create!(name: 'شهریار' , state: 'تهران')
City.create!(name: 'فیروزکوه' , state: 'تهران')
City.create!(name: 'کرج' , state: 'تهران')
City.create!(name: 'نظرآباد' , state: 'تهران')
City.create!(name: 'ورامین' , state: 'تهران')
City.create!(name: 'اردل' , state: 'چهارمحال و بختیاری')
City.create!(name: 'بروجن' , state: 'چهارمحال و بختیاری')
City.create!(name: 'شهرکرد' , state: 'چهارمحال و بختیاری')
City.create!(name: 'فارسان' , state: 'چهارمحال و بختیاری')
City.create!(name: 'کوهرنگ' , state: 'چهارمحال و بختیاری')
City.create!(name: 'لردگان' , state: 'چهارمحال و بختیاری')
City.create!(name: 'بیرجند' , state: 'خراسان جنوبی')
City.create!(name: 'درمیان' , state: 'خراسان جنوبی')
City.create!(name: 'سرایان' , state: 'خراسان جنوبی')
City.create!(name: 'سربیشه' , state: 'خراسان جنوبی')
City.create!(name: 'فردوس' , state: 'خراسان جنوبی')
City.create!(name: 'قائنات' , state: 'خراسان جنوبی')
City.create!(name: 'نهبندان' , state: 'خراسان جنوبی')
City.create!(name: 'بردسکن' , state: 'خراسان رضوی')
City.create!(name: 'تایباد' , state: 'خراسان رضوی')
City.create!(name: 'تربت جام' , state: 'خراسان رضوی')
City.create!(name: 'تربت حیدریه' , state: 'خراسان رضوی')
City.create!(name: 'چناران' , state: 'خراسان رضوی')
City.create!(name: 'خلیل‌آباد' , state: 'خراسان رضوی')
City.create!(name: 'خواف' , state: 'خراسان رضوی')
City.create!(name: 'درگز' , state: 'خراسان رضوی')
City.create!(name: 'رشتخوار' , state: 'خراسان رضوی')
City.create!(name: 'سبزوار' , state: 'خراسان رضوی')
City.create!(name: 'سرخس' , state: 'خراسان رضوی')
City.create!(name: 'فریمان' , state: 'خراسان رضوی')
City.create!(name: 'قوچان' , state: 'خراسان رضوی')
City.create!(name: 'کاشمر' , state: 'خراسان رضوی')
City.create!(name: 'کلات' , state: 'خراسان رضوی')
City.create!(name: 'گناباد' , state: 'خراسان رضوی')
City.create!(name: 'مشهد' , state: 'خراسان رضوی')
City.create!(name: 'مه ولات' , state: 'خراسان رضوی')
City.create!(name: 'نیشابور' , state: 'خراسان رضوی')
City.create!(name: 'بجنورد' , state: 'خراسان شمالی')
City.create!(name: 'شیروان' , state: 'خراسان شمالی')
City.create!(name: 'آبادان' , state: 'خوزستان')
City.create!(name: 'امیدیه' , state: 'خوزستان')
City.create!(name: 'اهواز' , state: 'خوزستان')
City.create!(name: 'ایذه' , state: 'خوزستان')
City.create!(name: 'باغ‌ملک' , state: 'خوزستان')
City.create!(name: 'بندر ماهشهر' , state: 'خوزستان')
City.create!(name: 'بهبهان' , state: 'خوزستان')
City.create!(name: 'خرمشهر' , state: 'خوزستان')
City.create!(name: 'دزفول' , state: 'خوزستان')
City.create!(name: 'دشت آزادگان' , state: 'خوزستان')
City.create!(name: 'رامشیر' , state: 'خوزستان')
City.create!(name: 'رامهرمز' , state: 'خوزستان')
City.create!(name: 'اسفراین' , state: 'خراسان شمالی')
City.create!(name: 'جاجرم' , state: 'خراسان شمالی')
City.create!(name: 'فاروج' , state: 'خراسان شمالی')
City.create!(name: 'مانه و سملقان' , state: 'خراسان شمالی')
City.create!(name: 'اندیمشک' , state: 'خوزستان')
City.create!(name: 'شادگان' , state: 'خوزستان')
City.create!(name: 'شوش' , state: 'خوزستان')
City.create!(name: 'شوشتر' , state: 'خوزستان')
City.create!(name: 'گتوند' , state: 'خوزستان')
City.create!(name: 'لالی' , state: 'خوزستان')
City.create!(name: 'مسجد سلیمان' , state: 'خوزستان')
City.create!(name: 'هندیجان' , state: 'خوزستان')
City.create!(name: 'ابهر' , state: 'زنجان')
City.create!(name: 'ایجرود' , state: 'زنجان')
City.create!(name: 'خدابنده' , state: 'زنجان')
City.create!(name: 'خرمدره' , state: 'زنجان')
City.create!(name: 'زنجان' , state: 'زنجان')
City.create!(name: 'طارم' , state: 'زنجان')
City.create!(name: 'ماه‌نشان' , state: 'زنجان')
City.create!(name: 'دامغان' , state: 'سمنان')
City.create!(name: 'سمنان' , state: 'سمنان')
City.create!(name: 'شاهرود' , state: 'سمنان')
City.create!(name: 'گرمسار' , state: 'سمنان')
City.create!(name: 'مهدی‌شهر' , state: 'سمنان')
City.create!(name: 'ایرانشهر' , state: 'سیستان و بلوچستان')
City.create!(name: 'چابهار' , state: 'سیستان و بلوچستان')
City.create!(name: 'خاش' , state: 'سیستان و بلوچستان')
City.create!(name: 'دلگان' , state: 'سیستان و بلوچستان')
City.create!(name: 'زابل' , state: 'سیستان و بلوچستان')
City.create!(name: 'زاهدان' , state: 'سیستان و بلوچستان')
City.create!(name: 'زهک' , state: 'سیستان و بلوچستان')
City.create!(name: 'سراوان' , state: 'سیستان و بلوچستان')
City.create!(name: 'سرباز' , state: 'سیستان و بلوچستان')
City.create!(name: 'کنارک' , state: 'سیستان و بلوچستان')
City.create!(name: 'نیک‌شهر' , state: 'سیستان و بلوچستان')
City.create!(name: 'آباده' , state: 'شيراز')
City.create!(name: 'ارسنجان' , state: 'شيراز')
City.create!(name: 'استهبان' , state: 'شيراز')
City.create!(name: 'اقلید' , state: 'شيراز')
City.create!(name: 'بوانات' , state: 'شيراز')
City.create!(name: 'پاسارگاد' , state: 'شيراز')
City.create!(name: 'جهرم' , state: 'شيراز')
City.create!(name: 'خرم‌بید' , state: 'شيراز')
City.create!(name: 'خنج' , state: 'شيراز')
City.create!(name: 'داراب' , state: 'شيراز')
City.create!(name: 'زرین‌دشت' , state: 'شيراز')
City.create!(name: 'سپیدان' , state: 'شيراز')
City.create!(name: 'شیراز' , state: 'شيراز')
City.create!(name: 'فراشبند' , state: 'شيراز')
City.create!(name: 'فسا' , state: 'شيراز')
City.create!(name: 'فیروزآباد' , state: 'شيراز')
City.create!(name: 'قیر و کارزین' , state: 'شيراز')
City.create!(name: 'کازرون' , state: 'شيراز')
City.create!(name: 'لارستان' , state: 'شيراز')
City.create!(name: 'لامِرد' , state: 'شيراز')
City.create!(name: 'مرودشت' , state: 'شيراز')
City.create!(name: 'ممسنی' , state: 'شيراز')
City.create!(name: 'مهر' , state: 'شيراز')
City.create!(name: 'نی‌ریز' , state: 'شيراز')
City.create!(name: 'آبیک' , state: 'قزوین')
City.create!(name: 'البرز' , state: 'قزوین')
City.create!(name: 'بوئین‌زهرا' , state: 'قزوین')
City.create!(name: 'تاکستان' , state: 'قزوین')
City.create!(name: 'قزوین' , state: 'قزوین')
City.create!(name: 'قم' , state: 'قم')
City.create!(name: 'بانه' , state: 'کردستان')
City.create!(name: 'بیجار' , state: 'کردستان')
City.create!(name: 'دیواندره' , state: 'کردستان')
City.create!(name: 'سروآباد' , state: 'کردستان')
City.create!(name: 'سقز' , state: 'کردستان')
City.create!(name: 'سنندج' , state: 'کردستان')
City.create!(name: 'قروه' , state: 'کردستان')
City.create!(name: 'کامیاران' , state: 'کردستان')
City.create!(name: 'مریوان' , state: 'کردستان')
City.create!(name: 'بافت' , state: 'کرمان')
City.create!(name: 'بردسیر' , state: 'کرمان')
City.create!(name: 'بم' , state: 'کرمان')
City.create!(name: 'جیرفت' , state: 'کرمان')
City.create!(name: 'راور' , state: 'کرمان')
City.create!(name: 'رفسنجان' , state: 'کرمان')
City.create!(name: 'رودبار جنوب' , state: 'کرمان')
City.create!(name: 'زرند' , state: 'کرمان')
City.create!(name: 'سیرجان' , state: 'کرمان')
City.create!(name: 'شهر بابک' , state: 'کرمان')
City.create!(name: 'عنبرآباد' , state: 'کرمان')
City.create!(name: 'قلعه گنج' , state: 'کرمان')
City.create!(name: 'کرمان' , state: 'کرمان')
City.create!(name: 'کوهبنان' , state: 'کرمان')
City.create!(name: 'کهنوج' , state: 'کرمان')
City.create!(name: 'منوجان' , state: 'کرمان')
City.create!(name: 'اسلام‌آباد غرب' , state: 'کرمانشاه')
City.create!(name: 'پاوه' , state: 'کرمانشاه')
City.create!(name: 'ثلاث باباجانی' , state: 'کرمانشاه')
City.create!(name: 'جوانرود' , state: 'کرمانشاه')
City.create!(name: 'دالاهو' , state: 'کرمانشاه')
City.create!(name: 'روانسر' , state: 'کرمانشاه')
City.create!(name: 'سرپل ذهاب' , state: 'کرمانشاه')
City.create!(name: 'سنقر' , state: 'کرمانشاه')
City.create!(name: 'صحنه' , state: 'کرمانشاه')
City.create!(name: 'قصر شیرین' , state: 'کرمانشاه')
City.create!(name: 'کرمانشاه' , state: 'کرمانشاه')
City.create!(name: 'کنگاور' , state: 'کرمانشاه')
City.create!(name: 'گیلان غرب' , state: 'کرمانشاه')
City.create!(name: 'هرسین' , state: 'کرمانشاه')
City.create!(name: 'بویراحمد' , state: 'کهگیلویه و بویراحمد')
City.create!(name: 'بهمئی' , state: 'کهگیلویه و بویراحمد')
City.create!(name: 'دنا' , state: 'کهگیلویه و بویراحمد')
City.create!(name: 'کهگیلویه' , state: 'کهگیلویه و بویراحمد')
City.create!(name: 'گچساران' , state: 'کهگیلویه و بویراحمد')
City.create!(name: 'آزادشهر' , state: 'گلستان')
City.create!(name: 'آزادشهر' , state: 'گلستان')
City.create!(name: 'آق‌قلا' , state: 'گلستان')
City.create!(name: 'بندر گز' , state: 'گلستان')
City.create!(name: 'ترکمن' , state: 'گلستان')
City.create!(name: 'رامیان' , state: 'گلستان')
City.create!(name: 'علی‌آباد' , state: 'گلستان')
City.create!(name: 'کردکوی' , state: 'گلستان')
City.create!(name: 'کلاله' , state: 'گلستان')
City.create!(name: 'گرگان' , state: 'گلستان')
City.create!(name: 'مراوه‌تپه' , state: 'گلستان')
City.create!(name: 'گنبد کاووس' , state: 'گلستان')
City.create!(name: 'مینودشت' , state: 'گلستان')
City.create!(name: 'آستارا' , state: 'گیلان')
City.create!(name: 'آستانه اشرفیه' , state: 'گیلان')
City.create!(name: 'اَملَش' , state: 'گیلان')
City.create!(name: 'بندر انزلی' , state: 'گیلان')
City.create!(name: 'رشت' , state: 'گیلان')
City.create!(name: 'رضوانشهر' , state: 'گیلان')
City.create!(name: 'رودبار' , state: 'گیلان')
City.create!(name: 'رودسر' , state: 'گیلان')
City.create!(name: 'سیاهکل' , state: 'گیلان')
City.create!(name: 'شَفت' , state: 'گیلان')
City.create!(name: 'صومعه‌سرا' , state: 'گیلان')
City.create!(name: 'طوالش' , state: 'گیلان')
City.create!(name: 'فومَن' , state: 'گیلان')
City.create!(name: 'لاهیجان' , state: 'گیلان')
City.create!(name: 'لنگرود' , state: 'گیلان')
City.create!(name: 'ماسال' , state: 'گیلان')
City.create!(name: 'سلسله' , state: 'لرستان')
City.create!(name: 'کوهدشت' , state: 'لرستان')
City.create!(name: 'آمل' , state: 'مازندران')
City.create!(name: 'بابل' , state: 'مازندران')
City.create!(name: 'بهشهر' , state: 'مازندران')
City.create!(name: 'بابلسر' , state: 'مازندران')
City.create!(name: 'تنکابن' , state: 'مازندران')
City.create!(name: 'جويبار' , state: 'مازندران')
City.create!(name: 'چالوس' , state: 'مازندران')
City.create!(name: 'رامسر' , state: 'مازندران')
City.create!(name: 'ساري' , state: 'مازندران')
City.create!(name: 'سوادکوه' , state: 'مازندران')
City.create!(name: 'قائم‌شهر' , state: 'مازندران')
City.create!(name: 'گلوگاه' , state: 'مازندران')
City.create!(name: 'محمودآباد' , state: 'مازندران')
City.create!(name: 'نکا' , state: 'مازندران')
City.create!(name: 'نور' , state: 'مازندران')
City.create!(name: 'نوشهر' , state: 'مازندران')
City.create!(name: 'آشتيان' , state: 'مرکزی')
City.create!(name: 'اراک' , state: 'مرکزی')
City.create!(name: 'تفرش' , state: 'مرکزی')
City.create!(name: 'خمين' , state: 'مرکزی')
City.create!(name: 'دليجان' , state: 'مرکزی')
City.create!(name: 'زرنديه' , state: 'مرکزی')
City.create!(name: 'ساوه' , state: 'مرکزی')
City.create!(name: 'شازند' , state: 'مرکزی')
City.create!(name: 'کميجان' , state: 'مرکزی')
City.create!(name: 'محلات' , state: 'مرکزی')
City.create!(name: 'ابوموسي' , state: 'هرمزگان')
City.create!(name: 'بستک' , state: 'هرمزگان')
City.create!(name: 'بندر عباس' , state: 'هرمزگان')
City.create!(name: 'بندر لنگه' , state: 'هرمزگان')
City.create!(name: 'جاسک' , state: 'هرمزگان')
City.create!(name: 'حاجي‌آباد' , state: 'هرمزگان')
City.create!(name: 'خمير' , state: 'هرمزگان')
City.create!(name: 'رودان' , state: 'هرمزگان')
City.create!(name: 'قشم' , state: 'هرمزگان')
City.create!(name: 'گاوبندي' , state: 'هرمزگان')
City.create!(name: 'ميناب' , state: 'هرمزگان')
City.create!(name: 'اسدآباد' , state: 'همدان')
City.create!(name: 'بهار' , state: 'همدان')
City.create!(name: 'تويسرکان' , state: 'همدان')
City.create!(name: 'رزن' , state: 'همدان')
City.create!(name: 'کبودرآهنگ' , state: 'همدان')
City.create!(name: 'ملاير' , state: 'همدان')
City.create!(name: 'نهاوند' , state: 'همدان')
City.create!(name: 'همدان' , state: 'همدان')
City.create!(name: 'ابرکوه' , state: 'یزد')
City.create!(name: 'اردکان' , state: 'یزد')
City.create!(name: 'بافق' , state: 'یزد')
City.create!(name: 'تفت' , state: 'یزد')
City.create!(name: 'خاتم' , state: 'یزد')
City.create!(name: 'صدوق' , state: 'یزد')
City.create!(name: 'طبس' , state: 'یزد')
