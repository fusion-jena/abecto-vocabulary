#!/bin/bash

# requires `pip install pylode`

# get version number form versionIRI
version="$(grep -Po -e "(?<=owl:versionIRI\s<http:\/\/w3id\.org\/abecto\/vocabulary\/).*(?=>)" abecto-vocabulary.ttl)"
echo "$version"

mkdir "docs/$version"
pylode -o "docs/$version/index" abecto-vocabulary.ttl
cp abecto-vocabulary.ttl "docs/$version/abecto-vocabulary.ttl"

# generate other RDF formats
python -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.jsonld', format='json-ld')"
python -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.nt', format='nt')"
python -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.ttl', format='turtle')"
python -c "import rdflib
rdflib.Graph().parse('abecto-vocabulary.ttl', format='turtle').serialize('docs/$version/abecto-vocabulary.rdf', format='pretty-xml')"

# symlinks for current version
cp "docs/$version/index.html" "docs/index.html"
cp "docs/$version/abecto-vocabulary.jsonld" "docs/abecto-vocabulary.jsonld"
cp "docs/$version/abecto-vocabulary.nt" "docs/abecto-vocabulary.nt"
cp "docs/$version/abecto-vocabulary.ttl" "docs/abecto-vocabulary.ttl"
cp "docs/$version/abecto-vocabulary.rdf" "docs/abecto-vocabulary.rdf"
