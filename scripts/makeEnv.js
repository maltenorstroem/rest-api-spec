#!/usr/bin/env node
/**
 * Run this to create an api_spec.js
 * You have to run scripts/prepapi.sh before you run this
 */
const fs = require('fs');

let env = { services: {},
            specs: {}
          };

// Services
let services = JSON.parse(fs.readFileSync('api/restlets.json'));
services.restlets.forEach((service)=>{
  env.services[service.general.name] = service
});

let specs = JSON.parse(fs.readFileSync('api/types.json'));
specs.types.forEach((type)=>{
  env.specs[type.type] = type
});

fs.writeFileSync("api/api_spec.js", "export const Services = " + JSON.stringify(env.services) + "; \n" + "export const Types = " + JSON.stringify(env.specs) + ";");
fs.writeFileSync("api/api_spec.json", JSON.stringify(env));

console.log("api/api_spec.js created");
console.log("api/api_spec.json created");
