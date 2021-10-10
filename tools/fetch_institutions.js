// import fetch from 'node-fetch';
// import fs from 'fs';
// import jsdom from 'jsdom';
// const { JSDOM } = jsdom;

// let i=1;
// const max = 316;
// let learningInst = [];

// for(i;i<=max;){
//  let result = await fetch(`https://listainstitutii.ro/tip/unitati-invatamant?act=1&judet=asc&pag=${i}`).then(result=>result.text()).then(html=>{
//     // console.log(html)
//     const jsDom = new JSDOM(html)
//      jsDom.window.document.querySelectorAll('tbody tr').forEach((row, i)=>{i> 0 ?learningInst.push({location:row.querySelectorAll('td')[1].textContent , name: row.querySelectorAll('td')[0].textContent}) : null;});
//      console.log(i, learningInst)
//      ++i;
//  });
// }

// console.log(learningInst)
// fs.writeFileSync('./institutions.json', JSON.stringify(learningInst))

// const fileContent = fs.readFileSync('./institutions.json')
// const institutions = JSON.parse(fileContent)
// console.log('number of institutions:', institutions.length)

import pg from '../node_modules/pg/lib/index.js';
import fs from 'fs';
const { Pool } = pg;
const pool = new Pool({
	user: 'postgres',
	host: 'localhost',
	database: 'analistul',
	password: '',
	port: 5432
});

await pool.connect();

const insertCounties = async () => {
	const judete_string =
		'["Bucureşti","Alba","Arad","Arges","Bacău","Bihor","Bistriţa-Năsăud","Botoşani","Braşov","Brăila","Buzău","Caraş-Severin","Călăraşi","Cluj","Constanţa","Covasna","Dâmboviţa","Dolj","Galaţi","Giurgiu","Gorj","Harghita","Hunedoara","Ialomiţa","Iaşi","Ilfov","Maramureş","Mehedinţi","Mureş","Neamţ","Olt","Prahova","Satu Mare","Sălaj","Sibiu","Suceava","Teleorman","Timiş","Tulcea","Vâlcea","Vaslui","Vrancea"]';
	const judete = JSON.parse(judete_string);
	console.log(judete);
	for (let i = 0; i < judete.length; ++i) {
		await pool.query("insert into judete(denumire) values('" + judete[i] + "');");
	}
};

const getCounties = async () => {
	const query = await pool.query('select * from judete;');
	console.log(query.rows);
};

getCounties();

const insertInstitutionsIntoDatabase = async () => {
	await pool.query('delete from institutii;');
	const institutions = JSON.parse(fs.readFileSync('./institutions.json'));
	console.log(institutions);
	// const results = await pool.query('select * from judete;');
	// console.log(results.rows);
	for (let i = 0; i < institutions.length; ) {
		const countLocation = institutions[i].location;
		const institutionName = institutions[i].name;
		const countyId = await pool.query(
			`select id from judete where unaccent(judete.denumire) = unaccent('${countLocation}');`
		);
		if (countyId.rowCount === 0) console.log(countLocation);
		else {
			// console.log(countyId.rowCount, countyId.rows[0]);
			const sql = `insert into institutii(denumire, id_judet) values ('${institutionName}', ${countyId.rows[0].id});`;
			// console.log(sql);
			try {
				await pool.query(sql);
			} catch (err) {
				console.error('sql', sql);
				throw err;
			}
		}
		// console.log(countyId.rows[0]);
		++i;
	}
	console.log('done');
};

insertInstitutionsIntoDatabase();
