#!/bin/bash

# download widoco.jar, if not present
if [ ! -f "widoco.jar" ] 
then
    curl -s -L -o widoco.jar https://github.com/dgarijo/Widoco/releases/download/v1.4.15/widoco-1.4.15-jar-with-dependencies.jar
fi

# get version number form versionIRI
version="$(grep -Po -e "(?<=owl:versionIRI\s<http:\/\/w3id\.org\/abecto\/vocabulary\/).*(?=>)" abecto-vocabulary.ttl)"
echo "$version"

# create version without owl:import statements to avoid inclusion of other terms
grep -v -e "owl:import" abecto-vocabulary.ttl > abecto-vocabulary-without-imports.ttl

# run WIDOCO (see https://github.com/dgarijo/Widoco#how-to-use-widoco )
java -jar widoco.jar -uniteSections -rewriteAll -getOntologyMetadata -excludeIntroduction -outFolder "docs/$version" -ontFile abecto-vocabulary-without-imports.ttl

# create rdf file with imports
#java -jar widoco.jar -uniteSections -rewriteAll -getOntologyMetadata -excludeIntroduction -outFolder "docs/$version-with-imports" -ontFile abecto-vocabulary.ttl
#mv -f "docs/$version-with-imports/ontology.jsonld" "docs/$version"
#mv -f "docs/$version-with-imports/ontology.nt" "docs/$version"
#mv -f "docs/$version-with-imports/ontology.rdf" "docs/$version"
#mv -f "docs/$version-with-imports/ontology.ttl" "docs/$version"

# cleanup
#rm -rf "docs/$version-with-imports"
rm abecto-vocabulary-without-imports.ttl
rm "docs/$version/readme.md"

# remove description and references section (http://austinmatzko.com/2008/04/26/sed-multi-line-search-and-replace/)
sed -i -n '1h;1!H;${;g;s/<!--DESCRIPTION SECTION-->.*<!--CROSSREF SECTION-->/<!--CROSSREF SECTION-->/g;p;}' "docs/$version/index-en.html"
sed -i -n '1h;1!H;${;g;s/<div id="references">.*<div id="acknowledgments">/<div id="acknowledgments">/g;p;}' "docs/$version/index-en.html"

# symlinks for current version
ln -frs "docs/$version/index-en.html" "docs/index.html"
ln -frs "docs/$version/index-en.html" "docs/index-en.html"
ln -frs "docs/$version/ontology.jsonld" "docs"
ln -frs "docs/$version/ontology.nt" "docs"
ln -frs "docs/$version/ontology.rdf" "docs"
ln -frs "docs/$version/ontology.ttl" "docs"
ln -frs "docs/$version/provenance" "docs"
ln -frs "docs/$version/resources" "docs"
