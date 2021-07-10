# MOBİL SORGULAR 

# Giriş
Bu projede belirlenen amaç, bir mobil uygulamagerçekleştirimi ile beraber bulut ortamı kullanarak sorgu yapma yöntemlerini geliştirme ve google map api kullanılarak bir android platformunda uygulama gerçeklenmesidir. Dart(Flutter) yazılım dili kullanılmıştır.Verileri,kullanılacak programa çekmek için bulut ortamı olarak Firebase Firestore kullanılmıştır.Geliştirilecek mobil uygulamanın içinde 3 farklı sorgu kullanılmış olup backend ve frontend kısımlarının geliştirilmiştir. Kullanıcının uygulamayı kullanabileceği android platform ve yapılacak sorgular etrafında proje şekillenmiştir.

# Yöntem
İlk adımda mobil uygulama arayüzü için giriş ve sorguların butonlarının olduğu ekran oluşturulmuştur. Dart(Flutter) sayesinde bu arayüz için gerekli butonlar, gerekli tasarımlarla 
anasayfa oluşturulmuştur.Anasayfa şu şekildedir:

![image](https://user-images.githubusercontent.com/73740709/125150772-0c4b7280-e14b-11eb-8366-a20251a272e0.png)

İkinci adımda verilerin çekilmesi için aşağıdaki sorgu uygulanmıştır:

![image](https://user-images.githubusercontent.com/73740709/125150792-28e7aa80-e14b-11eb-8016-c87370413171.png)

Üçüncü adımda 1.Sorgu için “Sorgu 1” butonuna tıklandığında Firebase üzerinden “En uzun mesafeli beş yolculuktaki gün ve mesafeler”sorgusunu sağlayıp verilerin çekilmesi 
sağlanmıştır. Verilerin çekilmesini sağlayan sorgu aşağıdaki gibidir:

![image](https://user-images.githubusercontent.com/73740709/125150823-559bc200-e14b-11eb-8be9-13287207162f.png)

Dördüncü adımda 2.Sorgu için “Sorgu 2” butonuna tıklandığında Firebase üzerinden “İki tarih arasında belirli bir lokasyondan hareket eden araç sayısı” sorgusunu sağlayıp
verilerin çekilmesi sağlanmıştır.Verilerin çekilmesini sağlayan sorgu aşağıdaki gibidir:

![image](https://user-images.githubusercontent.com/73740709/125150893-c511b180-e14b-11eb-8c8b-1234137be08f.png)


 
# Sonuçlar

İlk Sorgu için Sorgu 1 butonuna basıldığında mesafeler şu şekilde listelenmiştir:

![image](https://user-images.githubusercontent.com/73740709/125150870-ab706a00-e14b-11eb-89bf-8a71ae27524a.png)








