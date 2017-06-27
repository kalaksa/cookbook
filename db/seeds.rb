users = [
  {email: "azachariasiewicz@gmail.com", username: "aga", password: "111111", password_confirmation: "111111"},
  {email: "cookbookabgaro@gmail.com", username: "admin", password: "111111", password_confirmation: "111111"},
  {email: "karol.kochan@gmail.com", username: "karol", password: "111111", password_confirmation: "111111"}
]
users.each do |user|
  u = User.new(user)
  u.skip_confirmation!
  u.save!
end

Comment.create!([
  {author_name: nil, body: "najlepsza foccacia jaką jadłam! mistrzostwo!", recipe_id: 1, user_id: 1},
  {author_name: nil, body: "można dodać też lody waniliowe :) ", recipe_id: 2, user_id: 2},
  {author_name: nil, body: "koniecznie muszę spróbować", recipe_id: 1, user_id: 2},
  {author_name: nil, body: "mango też by tam pasowało", recipe_id: 5, user_id: 3}
])
Recipe.create!([
  {title: "Focaccia z oliwkami", body: "Do połowy ciepłej wody dodać pokruszone drożdże, 1 łyżeczkę cukru i wymieszać. Odstawić na około 10 - 15 minut do czasu aż drożdże utworzą pianę na powierzchni (gdyby woda się ochłodziła po dodaniu drożdży, można naczynie z drożdżami wstawić w gorącą wodę i w ten sposób podgrzać rozczyn. Drożdże muszą mieć ciepłą wodę do wyrośnięcia, ale nie gorącą).\r\nMąkę przesiać do dużej miski, dodać rozczyn z drożdży i resztę ciepłej wody (w razie konieczności należy ją podgrzać), wymieszać łyżką, dodać sól i całą oliwę (1/4 szklanki + 2 łyżki). Ciasto wyrabiać dokładnie przez około 10 - 15 minut (ręką lub mikserem) do czasu aż będzie miękkie, elastyczne i gładkie (nie powinno się też za bardzo kleić). Uformować kulę naoliwionymi dłońmi i przełożyć ją do dużej miski, odstawić w ciepłe miejsce na 45 minut do wyrośnięcia (ciasto powinno dwukrotnie powiększyć swoją objętość).\r\nW miseczce wymieszać posiekane oliwki, oliwę, tarty ser, kapry, 1 łyżkę posiekanych listków rozmarynu (opcjonalnie).\r\nUderzyć pięścią w wyrośnięte ciasto, chwilę powyrabiać w misce, następnie wyłożyć na posmarowany oliwą arkusz papieru do pieczenia i palcami rozpłaszczyć na placek około 30 - 40 cm. Wyłożyć nadzienie i złożyć ciasto na 3 części: najpierw jeden krótszy bok do środka placka, później drugi bok założyć na pierwszy, w ten sposób powstaną 3 warstwy ciasta z nadzieniem w środku. Zlepić brzegi i przełożyć razem z papierem do większej formy o wymiarach około 35 - 40 cm. Rozpłaszczyć ciasto palcami na większy placek. Na wierzch położyć listki rozmarynu (opcjonalnie) i odstawić w ciepłe miejsce do wyrośnięcia na około 45 minut.\r\nPiekarnik nagrzać do 200 stopni C, wstawić blaszkę z wyrośniętym ciastem do środka piekarnika i piec przez 35 minut. Po upieczeniu ostudzić, następnie pokroić na kawałki. Maczać z oliwie z dodatkiem soli, pieprzu, suszonych ziół.", components: "30 g świeżych drożdży (w temperaturze pokojowej)\r\n300 g ciepłej wody\r\n1 łyżeczka cukru\r\n500 g mąki pszennej\r\n2 łyżeczki soli morskiej\r\n1/4 szklanki + 2 łyżki oliwy extra vergine\r\n1 szklanka zielonych oliwek, posiekanych\r\n2 łyżki oliwy extra vergine\r\n1 szklanka tartego sera np. pecorino, parmezanu, cheddara\r\n2 łyżki kaparów (opcjonalnie)\r\n1 gałązka świeżego rozmarynu (opcjonalnie)", user_id: 3, remote_image_url: "db/seed_images/2.jpg"},
  {title: "Milkshake truskawkowy", body: "Truskawki opłukać i oderwać szypułki. Zmiksować z mlekiem i lodami.\r\nWlać do wysokiej szklanki, udekorować bitą śmietaną i połówką truskawki, posypać szczyptą brązowego cukru.\r\n* w wersji fit zamiast lodów możemy dodać 1 łyżkę syropu klonowego i 1 łyżeczkę cukru pudru oraz zrezygnować z bitej śmietany (wówczas 263 kcal)", components: "250 g truskawek\r\n200 ml zimnego mleka\r\n100 g lodów waniliowych*\r\ndo podania: bita śmietana, szczypta brązowego cukru, połówka truskawki", user_id: 1, remote_image_url: "db/seed_images/5.jpg"},
  {title: "Lody truskawkowe", body: "Jogurt grecki włożyć do miski, dodać mleko skondensowane oraz zmiksowane na mus truskawki, dokładnie wymieszać. Przełożyć do maszyny do lodów lub wstawić do zamrażarki na kilka godzin, w międzyczasie - co około pół godziny - masę dokładnie wymieszać (w ten sposób pozbywamy się kryształków lodu).\r\nUżywając schłodzonej sorbetiery lody otrzymamy w zasadzie natychmiast i to bez żadnej pracy, gdyż wcześniej schładzamy misę sorbetiery (min. 24 godziny) i wkładamy do niej masę tylko na kilka(naście) minut mieszania - po tym czasie lody są już gotowe.", components: "1 duże opakowanie jogurtu greckiego (330 g)\r\n100 ml słodzonego mleka skondensowanego z puszki\r\n250 g truskawek", user_id: 1, remote_image_url: "db/seed_images/4.jpg"},
  {title: "Kaszotto z kurczakiem i botwinką", body: "Na dużą patelnię wsypać kaszę, dodać łyżkę oliwy i chwilę podsmażyć. W międzyczasie pokroić w kosteczkę cebulę, włożyć na patelnię i smażyć mieszając od czasu do czasu przez 3 minuty aż cebula się zeszkli.\r\nDodać pokrojonego na półplasterki pora (białą i jasnozieloną część, dokładnie opłukane). Wymieszać, dodać drugą łyżkę oliwy, suszony tymianek i smażyć przez ok. 3 minuty.\r\nPrzesunąć składniki na bok patelni, w wolne miejsce wlać trzecią łyżkę oliwy, włożyć pokrojone w kosteczkę filety z kurczaka, doprawić solą, pieprzem i obsmażać przez ok. 2 - 3 minuty. W tym czasie składniki obok 1-2 razy przemieszać.\r\nWymieszać wszystkie składniki na patelni i wlać białe wino, gotować 2-3 minuty aż odparuje. Następnie dodać obrane i pokrojone na półplasterki buraczki z botwinki (liście zachować), wlać gorący bulion. Doprawić świeżo zmielonym pieprzem i w razie potrzeby solą.\r\nPo zagotowaniu przykryć pokrywą i gotować przez ok. 23 minuty. Po tym czasie otworzyć garnek dodać posiekane liście botwinki (wraz z łodyżkami), powciskać je drewnianą łyżką w składniki na patelni, przykryć i gotować kolejne 5 minut. Na koniec wymieszać i podgrzewać bez przykrycia jeszcze przez 2 - 3 minuty.", components: "1/3 szklanki kaszy pęczak\r\n3 łyżki oliwy extra vergine\r\n1 cebula\r\n1 por\r\n1 łyżeczka suszonego tymianku\r\n250 g polędwiczek z kurczaka lub 1 pojedyncza pierś\r\n1/3 szklanki białego wina\r\n1 pęczek botwinki z małymi buraczkami\r\n1 i 1/2 szklanki bulionu drobiowego (użyłam rosołu)", user_id: 1, remote_image_url: "db/seed_images/3.jpg"},
  {title: "Smoothie z papai", body: "Papaję przekroić wzdłuż na pół. Z połowy papai wybrać łyżką nasiona oraz obrać ją ze skórki. Drugą połówkę można schować do lodówki i wykorzystać przy innej okazji.\r\nPapaję pokroić w kostkę i włożyć do pojemnika blendera. Dodać obranego pokrojonego banana, mleko roślinne i wodę kokosową oraz syrop klonowy. Zmiksować na aksamitną konsystencję.", components: "1/2 papai\r\n1 banan\r\n1 szklanka mleka roślinnego (np. migdałowo - ryżowego)\r\n1 szklanka wody kokosowej (lub mleka roślinnego j.w.)\r\n1 łyżka syropu klonowego", user_id: 2, remote_image_url: "db/seed_images/6.jpg"},
  {title: "Focaccia z kurkami i oregano", body: "Kurki opłukać i dokładnie osuszyć, większe pokroić. Włożyć do miseczki, doprawić solą, wymieszać z oliwą lub masłem i odstawić.\r\nDo ciepłej wody dodać pokruszone drożdże, 1 łyżeczkę cukru i 1 łyżkę mąki, wymieszać. Odstawić na około 15 minut do czasu aż drożdże utworzą pianę na powierzchni.\r\nMąkę przesiać do dużej miski, dodać rozczyn z drożdży, sól i wszystko wymieszać ręką lub drewnianą łyżką. Zacząć wyrabiać ciasto wlewając oliwę. Ciasto wyrabiać przez około 10 - 15 minut (ręką lub mikserem). Odstawić w ciepłe miejsce na około 45 minut do wyrośnięcia (ciasto powinno dwukrotnie powiększyć swoją objętość).\r\nTortownicę lub prodiż wysmarować oliwą. Wyłożyć ciasto, rozpłaszczyć palcami po całej powierzchni wciskając opuszki palców w ciasto, raz koło razu. Wyłożyć kurki, posypać świeżym oregano i odstawić w ciepłe miejsce do wyrośnięcia na około 45 minut.\r\nPiekarnik nagrzać do 180 stopni C, prodiża na razie nie włączać. Wstawić blaszkę z wyrośniętym ciastem do środka piekarnika (bez przykrycia) i piec przez około 35 - 40 minut, lub przykryć i podłączyć prodiż i piec przez około 50-60 minut. Ciasto ma się zrumienić a wetknięty patyczek ma być suchy. W różnych piekarnikach i w różnych blaszkach focaccia inaczej się będzie piekła, warto więc ją obserwować i w odpowiednim momencie sprawdzić. Jeśli kurki będą już bardzo zrumienione, focaccię można przykryć kawałkiem folii aluminiowej.\r\nCiasto ostudzić przed pokrojeniem. Można maczać z oliwie z dodatkiem soli, pieprzu, suszonych ziół. Można podgrzewać na tosterze lub grillu przed podaniem. Po dokładnym ostudzeniu przechowywać w temperaturze pokojowej pod przykryciem lub w zamkniętym prodiżu.", components: "40 g świeżych drożdży (w temperaturze pokojowej)\r\n300 ml ciepłej wody\r\n1 łyżeczka cukru\r\n500 g mąki pszennej (tortowej)\r\n2 łyżeczki soli morskiej\r\n60 ml oliwy extra vergine + do posmarowania blachy lub prodiża\r\ngarść kurek\r\nszczypta soli\r\n1/2 łyżki oliwy lub roztopionego masła\r\nświeże oregano (tymianek lub szczypta suszonych ziół)", user_id: 3, remote_image_url: "db/seed_images/1.jpg"}
])
Tag.create!([
  {name: "focaccia"},
  {name: "oliwki"},
  {name: "pieczywo"},
  {name: "smoothie"},
  {name: "milkshake"},
  {name: "truskawki"},
  {name: "lody"},
  {name: "deser"},
  {name: "kaszotto"},
  {name: "kasza"},
  {name: "obiad"},
  {name: "kurczak"},
  {name: "botwinka"},
  {name: "papaja"},
  {name: "kurki"}
])
Tagging.create!([
  {tag_id: 1, recipe_id: 1},
  {tag_id: 2, recipe_id: 1},
  {tag_id: 3, recipe_id: 1},
  {tag_id: 4, recipe_id: 2},
  {tag_id: 5, recipe_id: 2},
  {tag_id: 6, recipe_id: 2},
  {tag_id: 6, recipe_id: 3},
  {tag_id: 7, recipe_id: 3},
  {tag_id: 8, recipe_id: 3},
  {tag_id: 9, recipe_id: 4},
  {tag_id: 10, recipe_id: 4},
  {tag_id: 11, recipe_id: 4},
  {tag_id: 12, recipe_id: 4},
  {tag_id: 13, recipe_id: 4},
  {tag_id: 4, recipe_id: 5},
  {tag_id: 14, recipe_id: 5},
  {tag_id: 1, recipe_id: 6},
  {tag_id: 3, recipe_id: 6},
  {tag_id: 15, recipe_id: 6}
])
