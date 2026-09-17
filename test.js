import { readFileSync } from 'node:fs';

function loadEnvFromFile() {
  try {
    const content = readFileSync(new URL('./env/.env1', import.meta.url), 'utf8');
    const requiresMatch = content.match(/^cds_requires='(.+)'$/m);
    const destinationsMatch = content.match(/^destinations='(.+)'$/m);

    if (requiresMatch && !process.env.cds_requires) {
      process.env.cds_requires = requiresMatch[1];
    }

    if (destinationsMatch && !process.env.destinations) {
      process.env.destinations = destinationsMatch[1];
    }
  } catch (error) {
    console.warn('Could not load env/.env1 automatically:', error.message);
  }
}

loadEnvFromFile();

const cds = (await import('@sap/cds')).default;

async function main() {
  console.log('Loaded service requirements:');
  console.log(JSON.stringify(cds.env.requires, null, 2));

  try {
    const businessPartnerApi = await cds.connect.to('API_BUSINESS_PARTNER');
    const rows = await businessPartnerApi.run(cds.ql`
      SELECT from A_BusinessPartner {
        BusinessPartner,
        BusinessPartnerFullName,
        BusinessPartnerCategory
      } limit 5
    `);

    console.log('\nBusiness Partner rows:');
    console.log(JSON.stringify(rows, null, 2));
    console.log(`\nRow count: ${rows.length}`);
  } catch (error) {
    console.error('\nFailed to read Business Partner data from the destination:');
    console.error(error);
    process.exitCode = 1;
  }
}

await main();