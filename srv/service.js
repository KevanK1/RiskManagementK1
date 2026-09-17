import cds from '@sap/cds';

export default cds.service.impl(async function () {
  const businessPartnerApi = await cds.connect.to('API_BUSINESS_PARTNER');

  // External entities are @cds.persistence.skip, so READ must be delegated.
  this.on('READ', 'A_BusinessPartner1', req => businessPartnerApi.run(req.query));
});
