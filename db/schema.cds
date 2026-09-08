namespace RiskManagementK1;

entity Risks
{
    key ID : UUID;
    title : String(100);
    priority : String(5);
    desc : String(100);
    impact : Integer;
    criticality : Integer;
    mitigation : Association to one Mitigations;
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
