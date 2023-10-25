@AbapCatalog.sqlViewName: 'ZKKCDS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS GitHub denemesi'
define view zkk_cds_git as select from ekko
left outer join ekpo as _ekpo
on ekko.ebeln = _ekpo.ebeln
left outer join mara as _mara
on _ekpo.matnr = _mara.matnr
left outer join makt as _makt
on _makt.matnr = _mara.matnr
and _makt.spras = $session.system_language 
left outer join lfa1 as _lfa1
on ekko.lifnr = _lfa1.lifnr
{
key ekko.ebeln,
_ekpo.ebelp,
_ekpo.matnr,
_makt.maktx,
_ekpo.werks,
_ekpo.lgort,
_ekpo.meins,
concat_with_space(_lfa1.stras, _lfa1.mcod3, 1 ) as adress
}
