curl -Lo coursier https://git.io/coursier-cli
chmod +x coursier
./coursier launch almond:0.13.4 --scala 2.12.12 -- --install --id scala212 --display-name "Scala (2.12)"
#./coursier launch almond:0.10.9 --scala 2.13.6 -- --install --id scala213 --display-name "Scala (2.13)"
rm -f coursier
