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

# cleanup
rm abecto-vocabulary-without-imports.ttl
rm "docs/$version/readme.md"
rm "docs/$version/readme.md"

# remove description and references section (http://austinmatzko.com/2008/04/26/sed-multi-line-search-and-replace/)
sed -i -n '1h;1!H;${;g;s/<!--DESCRIPTION SECTION-->.*<!--CROSSREF SECTION-->/<!--CROSSREF SECTION-->/g;p;}' "docs/$version/index-en.html"
sed -i -n '1h;1!H;${;g;s/<div id="references">.*<div id="acknowledgments">/<div id="acknowledgments">/g;p;}' "docs/$version/index-en.html"

# symlinks for current version
ln -frs "docs/$version/index-en.html" "docs/index.html"
ln -frs "docs/$version/index-en.html" "docs/index-en.html"
ln -frs "docs/$version/ontology.jsonld" "docs/ontology.jsonld"
ln -frs "docs/$version/ontology.nt" "docs/ontology.nt"
ln -frs "docs/$version/ontology.rdf" "docs/ontology.rdf"
ln -frs "docs/$version/ontology.ttl" "docs/ontology.ttl"
ln -frs "docs/$version/provenance" "docs/provenance"
ln -frs "docs/$version/resources" "docs/resources"
