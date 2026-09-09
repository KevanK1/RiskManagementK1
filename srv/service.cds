using { RiskManagementK1 as my } from '../db/schema.cds';

using { API_BUSINESS_PARTNER.A_BusinessPartner } from './external/OP_API_BUSINESS_PARTNER_SRV';

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

    @cds.redirection.target
    entity A_BusinessPartner1 as
        projection on A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskManagementK1Service with @requires :
[
    'authenticated-user'
];
