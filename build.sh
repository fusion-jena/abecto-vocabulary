# download widoco.jar, if not present
if [ ! -f "widoco.jar" ] 
then
    wget -q -O widoco.jar https://github.com/dgarijo/Widoco/releases/download/v1.4.14/widoco-1.4.14-jar-with-dependencies.jar
fi 

# run WIDOCO (see https://github.com/dgarijo/Widoco#how-to-use-widoco )
java -jar widoco.jar -uniteSections -rewriteAll -getOntologyMetadata -outFolder docu -ontFile abecto-vocabulary.ttl
