using { RiskManagementK1 as my } from '../db/schema.cds';

@path : '/service/RiskManagementK1Service'
service RiskManagementK1Service
{
    @cds.redirection.target
    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @cds.redirection.target
    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;
}

annotate RiskManagementK1Service with @requires :
[
    'authenticated-user'
];
