using riskmanagement as rm from '../db/schema';

annotate rm.Risks with
{
ID     @title : 'Risk';
title  @title : 'Title';
owner  @title : 'Owner';
prio   @title : 'Priority';
descr  @title : 'Description';
miti   @title : 'Mitigation';
impact @title : 'Impact';
bp @title : 'Business Partner';
}

annotate rm.Mitigations with
{
@UI : { Hidden }    
@Common : { Text : descr }
ID;    
@title : 'Owner'    
owner;
@title : 'Description'
descr;
}

annotate rm.BusinessPartners  with
{
  @UI : { Hidden, }
  @Common : { Text : LastName }
  BusinessPartner;
  @title : 'First Name'
  FirstName;
  @title : 'Last Name'
  LastName;
}



annotate rm.Risks with
{
@Common : { Text : miti.descr,
            TextArrangement : #TextOnly,
            ValueList : {
                Label : 'Mitigation',
                $Type : 'Common.ValueListType',
                CollectionPath : 'Mitigations',
                Parameters : [
              
                ],
            },
          }
miti;

bp @(Common : {
   Text : bp.LastName,
   TextArrangement : #TextOnly,
   ValueList : {
      Label : 'Business Partners',
      CollectionPath : 'BusinessPartners',
      Parameters : [
         {
           $Type : 'Common.ValueListParameterInOut',
           LocalDataProperty : bp_BusinessPartner,
           ValueListProperty : 'BusinessPartner'
         },
         {
            $Type : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'LastName'
          },
          {
             $Type : 'Common.ValueListParameterDisplayOnly',
             ValueListProperty : 'FirstName'
          }
       ]
     }
   })
}
