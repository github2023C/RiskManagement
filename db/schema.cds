namespace riskmanagement;
using { managed } from '@sap/cds/common';

entity Risks : managed
{
@Core.Computed : true
key ID : UUID;
title : String(50);
owner : String;
prio : String(5);
descr : String;
miti : Association to Mitigations;
impact : Integer;
bp : Association to BusinessPartners; 
 //bp : Association to BusinessPartners;
 // You will need this definition in a later step
criticality : Integer;
}

entity Mitigations : managed {
    
@Core.Computed :true
key ID : UUID;
descr : String;
owner : String;
timeline : String;
risk : Association to many Risks on risk.miti = $self;
}

using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartners as projection on external.A_BusinessPartner
{
    key BusinessPartner,
    FirstName,
    LastName
}