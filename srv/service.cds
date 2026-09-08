using { RiskManagementK1 as my } from '../db/schema.cds';

@path : '/service/RiskManagementK1Service'
service RiskManagementK1Service
{
}

annotate RiskManagementK1Service with @requires :
[
    'authenticated-user'
];
