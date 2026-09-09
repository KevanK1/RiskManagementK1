namespace RiskManagementK1;

using { API_BUSINESS_PARTNER.A_BusinessPartner } from '../srv/external/OP_API_BUSINESS_PARTNER_SRV';

entity Risks
{
    key ID : UUID;
    title : String(100);
    priority : String(5);
    desc : String(100);
    impact : Integer;
    criticality : Integer;
    mitigation : Association to one Mitigations;
    a_BusinessPartner : Association to one A_BusinessPartner;
}

entity Mitigations
{
    key ID : UUID;
    createdAt : String(100);
    createdBy : String(100);
    desc : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.mitigation = $self;
}
