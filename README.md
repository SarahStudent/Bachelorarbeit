Test einer Strategie auf Minimalität
# Bachelorarbeit
Hier stelle ich generelles, ergänzendes und zusätzliches Material zu meiner Bachelorarbeit "Implementierung eines Verfahrens für Matrixspiele mit vektorieller Auszahlung" zur Verfügung und gehe auf Einiges ein. Die Bachelorarbeit basiert auf dem Preprint des 2018 erschienen Artikels "A set optimization
approach to zero-sum matrix games with multi-dimensional payoffs" von Andreas Hamel und Andreas Löhne (https://arxiv.org/pdf/1701.08514.pdf).

## Voraussetzungen
Damit meine Codedateien ausgeführt werden können, musst du entweder MATLAB oder Octave verwenden. Ich habe die Dateien mit MATLAB Version 9.13 (R2022b) erstellt. Außerdem muss die frei verfügbare Software bensolve tools installiert sein. Dazu befolge einfach die Anleitung zum Download und zur Installation auf http://tools.bensolve.org/. Ich habe bensolve tools in einen Ordner in meiner MATLAB Installation geladen und in diesem Ordner meine Codes erstellt und laufen lassen. bensolve tools ist zwingend notwendig für eine erfolgreiche Ausführung meiner Codedateien, weil ich mehrmals unterschiedliche Funktionen der Software verwende. Deshalb empfehle ich bei möglichen Unkarheiten bezüglich einiger Funktionen, Polyeder oder Optimierungsproblemen das Manual der bensolve tools zu lesen. Es enthält meiner Meinung nach sehr ausführliche Erklärungen mit anschaulichen Beispielen. Um meine Codes ausführen zu können, musst du sie lediglich in den Ordner deiner bensolve tools Installation laden, die sich in deiner MATLAB oder Octave Umgebung befindet.

Ein zusätzlicher Hinweis, falls du Octave benutzen solltest: Bevor du bensolve tools und/ oder meine Codes verwendest musst du den Befehl "make_oct" in dem Octave Terminal eingeben und laufen lassen, damit bensolve tools weiß, dass du Octave verwendest. Bei MATLAB musst du dies NICHT tun.

## Hauptziel und Thema der Bachelorarbeit und diesem Repository
In dem Preprint https://arxiv.org/pdf/1701.08514.pdf wird von Andreas Hamel und Andreas Löhne ein neuer Ansatz zur Lösung von 2x2 Spielmatrizen vorgestellt. Als Ergebniss erhält man minimale Strategien für Spieler 1 und maximale Strategien für Spieler 2, die gespielt werden sollten, wenn die Spieler:innen eine ABneigung gegenüber Verlusten aufweisen. Im Rahmen meiner Bachelorarbeit ist eine Implementierung geschaffen worden, die **testet, ob eine Strategie minimal beziehungsweise maximal für die spielende Person ist (optimzetest.m)**. Dazu wird bensolve tools (http://tools.bensolve.org/) verwendet. Für eine ausführliche Einleitung in das Thema verweise ich auf die Einleitung meiner Bachelorarbeit, die sich im PDF Format ebenfalls in dem Repository befindet.

## Codedateien (.m)
In allen Codedateien sind die Variablen wie folgt zu interpretieren:
- p ist eine zulässige Strategie des Spielers 1
- q ist eine zulässige Strategie der Spielrin 2
- g ist die mxn Matrix des Matrixspiels
- H, h sind die Matrix und der Vektor der H-Darstellung eines Polyeders
- B1, b1 sind die Matrix und der Vektor der H-Darstellung eine Polyeder, der durch die Strategie p von Spieler 1 erzeugt wird, multipliziert mit -1
- B2, b2 sind die Matrix und der Vektor der H-Darstellung eine Polyeder, der durch die Strategie q von Spielerin 2 erzeugt wird, multipliziert mit -1
- ecken1, ecken2, ecken sind Matrizen, in deren Spalten die Ecken des jeweils zugehörigen Polyeders stehen

### optimizetest.m
Die Implementierung stellt das Hauptergebniss meiner Arbeit dar und ermittelt anhand der H-Darstellung und Ecken des Polyeders V1(p) sowie der Spielmatrix g für eine gegebene Toleranzgrenze, ob die Strategie p für den SPieler 1 minimal ist. Das Verfahren basiert auf Theorem 4.3 aus dem Preprint https://arxiv.org/pdf/1701.08514.pdf. ist der Rückgabewert der Funktion kleiner der Toleranz liegt eine minimale Strategie vor. Mit dieser Funktion lässt auch überprüfen, ob eine Strategie q für die Spieler 2 maximal ist. Hierzu muss vorher die Spielmatrix g transponiert und mit -1 multipliziert werden. Das ergibt sich aus der Symmetrie des Spiels. Die Rollen der Spieler:innen können dadurch einfach vertauscht werden. Für ein Anwendungsbeispiel des Optimalitätstests empfiehlt sich ein Blick in dreidimensionale_Matrix_Abbildungen.m Zeile 5 und 6 sowie 88-131. Hier wird für das Beispiel 5.3 der Bachelorarbeit die Menge der minimalen und maximalen Strategien unter Verwendung der Funktion optimzetest.m bestimmt. Damit optimezetest.m funktioniert benötigst du außerdem hyperplane.m. Dabei handelt es sich um eine Hilfsfunktion, die für eine gegebene H-Darstellung und Ecke eines Polyeders nachprüft, in welchen Ungleichungen Gleichheit vorliegt. Rückgabewert ist die Summe der entsprechenden Matrixzeilen und Vektorzeilen.

### test.m und findOptimalStrategies.m
findOptimalStrategies.m ist eine Funktion, die mehrere Funktionen vereint: optimzetest.m, poss1.m, poss2.m, calculateV1.m und calculateV2.m. Sie ist dazu gedacht gebündelt ein Matrixspiel komplett zu analysieren.

test.m stellt eine Beispieleingabe für findOptimalStrategies.m dar und soll aufzeigen, wie eine gültige Eingabe für die Sammelfunktion aussieht.

ACHTUNG: aus rein technischen Gründen ist es nicht möglich sich gleichzeitig alle minimalen und/ oder maximalen Strategien plotten zu lassen UND die zugehörigen Auszahlungen. NUR EINES DER BEIDEN IST MÖGLICH!

### restliche Codedateien
- calculateV1.m: berechnet den Polyeder der Strategie p für Spieler 1 im Spiel (Formel sieh https://arxiv.org/pdf/1701.08514.pdf Seite 7).
- calculateV2.m: berechnet den Polyeder der Strategie 2 für Spielerin 2 im Spiel (Formel siehe https://arxiv.org/pdf/1701.08514.pdf Seite 8). Die beiden Funktionen dienen dazu, die Parameter der H-Darstellungen und Ecken zu bestimmen um anschließend damit weiter zu arbeiten (z.B. für optimzetest.m).
- calculate_v_p_q.m: berechnet die Auszahlung, wenn die Strategien p und q gespielt werden (Formel siehe https://arxiv.org/pdf/1701.08514.pdf Seite 5). Die Funktion wird benötigt, um zu bestimmen, ob zwei Strategien p und q im Spiel g ein SHapley-Gleichgewicht darstellen oder nicht
- laufzeit_mx_nx.m mit x=2,3,4: hiermit habe ich die Laufzeitanalyse meiner Implementierung von optimizetest.m erstellt. Der Parameter K wurde geändert und der Code nochmal ausgeführt, um die Tabelle 3 meiner Bachelorarbeit zu erstellen. Dadurch kann die Laufzeit mit der Implementierung des Preprints https://arxiv.org/pdf/1701.08514.pdf (Tabelle 5.2) verglichen werden. Auffällig hierbei war, dass es vereinzelt zu fehlerbedingten Abbrüchen durch Problemen mit der Funktion eval() der bensolve tools kam.
- nachpruefen_ergebnisse_2kreuzt2_Matrizen.m: Hier werden für ein eigenes (Bachelorarbeit Beispiel 2.1) und zwei Beispiele aus dem Preprint https://arxiv.org/pdf/1701.08514.pdf (Beispiel 2.1 und 2.15) die Menge der minimalen und maximalen Strategien bestimmt.
- testShapleyGG.m: hier werden zwei Strategie p und q für das Spiel g anhand der Vorgehensweise im Preprint https://arxiv.org/pdf/1701.08514.pdf Seite 22 auf ein Shapley-Gleichgewicht getestet. Die Definition eines Shapley-Geichgewichts befindet sich im Preprint auf Seite 10 in Definition 2.11.
- testShapleyGG.m: hier werden zwei Strategie p und q für das Spiel g anhand der Vorgehensweise im Preprint https://arxiv.org/pdf/1701.08514.pdf Seite 22 auf ein Shapley-Gleichgewicht getestet. Die Definition eines Shapley-Geichgewichts befindet sich im Preprint auf Seite 10 in Definition 2.11.testStarkesSchapleyGG
- testStarkesShapleyGG.m: hier werden zwei Strategie p und q für das Spiel g anhand der Vorgehensweise im Preprint https://arxiv.org/pdf/1701.08514.pdf Seite 22 und 23 auf ein starkes Shapley-Gleichgewicht getestet. Die Definition eines starken Shapley-Geichgewichts befindet sich im Preprint auf Seite 10 in Definition 2.11.

## Bilddateien (.jpg)
Alle Bilddateien in diesem Repository werden durch die Dateien dreidimensionale_Matrix_Abbildungen.m und Abbildungen.m erzeugt, wobei Erstere nur die Abbildungen für das dreidimensionale Beispiel aus der Bachelorarbeit (Beispiel 5.3) kreiert. Allerdings werden die Bilder im eps-Format abgespeichert, da dies für die Generierung der Bachelorarbeit im PDF-Format mittels LaTeX und Overleaf (https://de.overleaf.com/learn) notwendig war.

Sie dienen der Veranschaulichung der Ergebnisse meiner Implementierungen. Es wurden die gleichen Beispiel wie im Preprint https://arxiv.org/pdf/1701.08514.pdf Kapitel 5 verwendet, damit die Korrektheit meines Code aufgezeigt wird. Viele der Abbildungen sind im numerischen Ergebnissteil meiner Bachelorarbeit auffindbar.
