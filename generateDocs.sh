#!/bin/bash

pip3 install pylode

# get version number form versionIRI
version="$(grep -Po -e "(?<=owl:versionIRI\s<http:\/\/w3id\.org\/abecto\/vocabulary\/).*(?=>)" abecto-vocabulary.ttl)"
echo "$version"

mkdir "docs/$version"
pylode -o "docs/$version/index" abecto-vocabulary.ttl
cp abecto-vocabulary.ttl "docs/$version/abecto-vocabulary.ttl"

# generate other RDF formats
python3 -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.jsonld', format='json-ld')"
python3 -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.nt', format='nt')"
python3 -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.ttl', format='turtle')"
python3 -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.rdf', format='pretty-xml')"

# symlinks for current version
ln -frs "docs/$version/index.html" "docs"
ln -frs "docs/$version/abecto-vocabulary.jsonld" "docs"
ln -frs "docs/$version/abecto-vocabulary.nt" "docs"
ln -frs "docs/$version/abecto-vocabulary.ttl" "docs"
ln -frs "docs/$version/abecto-vocabulary.rdf" "docs"
