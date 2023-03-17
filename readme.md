
Installation : 
- git clone (repo url)
- run the server yarn start:dev
- flutter run (for the frontend app)

Project Architecture : (Client - Server)
- frontend app : flutter
- backend app : nodeJs x apollo server (graphQl)


TechStack : 
- Backend : NodeJs , typescrips , prisma , graphql

- Prisma : modern orm for abstracting databases acess and codegen 
- GraphQl : A superset of rest api explored in 2020

Frontend app :

Folder Structure :

- Ui : generic reusable ui elements 
- Feautures : each feature/screen it's ui,state management and logic is self contained within it's own folder 
    each feature is structured in the following way :
    - ui : all ui elements
    - logic : all the logic code , controllers , communicating with infrastructure

- DataModel : the data models used in the projects and across the features
- Application : orchestration , error handling and utility code
- Infrastrucure : 
    - all techincal related functionality composed into a services Gateway which contain a list of all services (registered dynamically)
    - an event is fired with the sendEvent functionality
    - we use binarySearch(hidden behind a search algorithm interface) and a serviceId embeded in the event to locate the target service
    - then each service is a self contained package with the same mechanism as the service Gateway but using a commandsList instead of services (command pattern)
    which allow maximuim scalability without ruining the existing code

Backend app : 
    - graphQl router 



