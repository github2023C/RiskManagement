using { riskmanagement as rm } from '../db/schema';

@path : 'service/risk'
service RiskService {

@odata.draft.enabled : true
entity Risks @(restrict : [
{
grant : [ 'read'],
to : [ 'RiskViewer' ]
},
{
grant : [ '*' ],
to : [ 'RiskManager' ]
}

] ) as projection on rm.Risks;

@odata.draft.enabled :true
entity Mitigations @(restrict : [
       {
         grant : [ 'READ' ],
         to : [ 'RiskViewer' ]
       },
       {
         grant : [ '*' ],
         to : [ 'RiskManager' ]
       }
   ])as projection on rm.Mitigations;

entity BusinessPartners as projection on rm.BusinessPartners;
}

