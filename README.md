# API Specification `Contract Mgmt Composite`

## API Design Guidelines
* [Guidelines](https://cloud.google.com/apis/design/)
* [Resource Oriented Design](https://cloud.google.com/apis/design/resources)

## DSL to describe the API
depending on: [Wir arbeiten mit dem Contract First Ansatz (Anbindung Business Web UI](https://confluence.adcubum.com/pages/viewpage.action?pageId=114866048)

## Objectives
* Gain insight into the API structure
* Define data content of resources
* Define meta data of fields
* Independent of implementation

# Use cases
| resource        | href              | params  | services                              | custom methods       |
|:--------------- |:------------------|:-------:|:------------------------------------- |:---------------------|
| vertraege       | /vertraege/       | cnt     | list, get, create, update, delete     | :release
| versobjekte     | /versobjekte/     | vso     | list, get, create, update, delete     |
| deckungen       | /deckungen/       | dck     | list, get, create, update, delete     |
| deckungsbuendel | /deckungsbuendel/ | dbl     | list, get, create, update, delete     |
| vertraege/{cnt}/vertragsteile | /vetraege/{cnt}/vertragsteile | cpt  | list, get, create, update, delete |

* [Standard Methods](https://cloud.google.com/apis/design/standard_methods)
* [Custom Methods](https://cloud.google.com/apis/design/custom_methods)

# Resources

![api contract mgmt composite](docs/api.svg)

# Type definitions

[types](api/types.json)