# The ABECTO Vocabulary

The ABECTO Vocabulary (AV) is vocabulary for the description of execution plans and results of the [ABox Evaluation and Comparison Tool for Ontologies (ABECTO)](https://github.com/fusion-jena/abecto). It reuses …

## Competency Questions

The vocabulary is designed to cover the following competency questions.

### Execution Plan

* What are the steps of an execution plan and which steps follow each other in which sequence?
* What is the Java class executing a step, what are their call parameters and which predefined meta data graph will be used?
* To which dataset will resulting primary data of a step belong?
* To which dataset belong some primary data?
* Which step produced some meta data or primary data in which time interval and which other data have been used to produces them?

### Categories / Scopes / Domains

*"Category" also used for groups of Quality Dimensions*

* 

### Resource Correspondence / Mapping

* Which resources of which dataset correspond to each other?
* Which resources of which dataset are known to not correspond to each other

### Quality Data

Measurements, Deviations, Omissions, Issues (e.g. Wrong Object Property Values / Data Property Values, other issues)

* 

## Model

![Schema visualization of the ABECTO Vocabulary](abecto-voc.svg)

## Topics

### Category

 * http://www.linkedmodel.org/schema/vaem#Domain
 * http://purl.org/cwmo/#KnowledgeDomain

### Measurement

* ```
  @prefix sdmx-attribute:  <http://purl.org/linked-data/sdmx/2009/attribute#> .
  ```

### Expectation/Wrong Value Annotation
* Do not state, something is right, just state something is wrong
    * reuse Issue

### Pipeline
* Node
    * https://www.w3.org/TR/prov-o/#SoftwareAgent
    * https://www.w3.org/TR/prov-o/#Activity
        * not for the plan, but the result
* Edge
    * https://www.w3.org/TR/prov-o/#wasInformedBy
        * not for the plan, but the result

## Related Vocabularies (Re-Use Candidates)
* Ontology Quality
    * dqv 	http://www.w3.org/ns/dqv#    https://www.w3.org/ns/dqv.ttl   https://www.w3.org/TR/vocab-dqv/
    * daq 	http://purl.org/eis/vocab/daq#
    * dcat 	http://www.w3.org/ns/dcat#
    * dcterms 	http://purl.org/dc/terms/
    * duv 	http://www.w3.org/ns/duv#
    * oa 	http://www.w3.org/ns/oa#
    * prov 	http://www.w3.org/ns/prov#
    * sdmx-attribute 	http://purl.org/linked-data/sdmx/2009/attribute#
    * skos 	http://www.w3.org/2004/02/skos/core#
* Ontology Mapping
    * https://moex.gitlabpages.inria.fr/alignapi/format.html
* Pipelines / Processes
    * CTRLont   https://technicalbuildingsystems.github.io/Ontologies/CTRLont/index-en.html
    * Machine Learning Schema   http://www.w3.org/ns/mls
    * http://ontologydesignpatterns.org/wiki/Community:Workflow
    * P-Plan     http://vocab.linkeddata.es/p-plan/index.html#Plan (looks good)
* Provenance and Metadata
* SPARQL Query Datatype


## Other interesting resources
* https://iswc2017.semanticweb.org/wp-content/uploads/papers/PostersDemos/paper565.pdf
* http://dgarijo.github.io/Widoco/doc/bestPractices/index-en.html

# Acknowledgements

Thanks to [Alsayed Algergawy](https://orcid.org/0000-0002-8550-4720) and [Sheeba Samuel](https://orcid.org/0000-0002-7981-8504) for suggesting some vocabularies to reuse.
