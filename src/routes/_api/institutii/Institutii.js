import pg from 'pg';
// import dotenv from 'dotenv';
// dotenv.config();
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const getAll = async () => {
	const sql = `select * from institutii;`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllAlphabetical = async () => {
	const sql = `select * from institutii order by institutii.denumire asc;`;
	const result = await pool.query(sql);
	return result.rows;
};

const searchForInstitution = async (searchQuery) => {
	const sql = `select * from institutii where unaccent(institutii.denumire) like unaccent('%${searchQuery}%') limit 25;`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllInstitutionsFromCountyId = async (countyId) => {
	const sql = `select * from institutii where institutii.id_judet = ${countyId};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllWithRating = async () => {
	const sql = `select * from institutii join rating_institutii on institutii.id = rating_institutii.id_institutie;`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllWithCountyName = async () => {
	const sql = `select * from institutii join judete on institutii.id_judet = judete.id;`;
	const result = await pool.query(sql);
	return result.rows;
};

const searchForInstitutionWithCountyName = async (query) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", id_judet, judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where institutii.denumire ilike unaccent('%${query}%') limit 50;`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllKindergardens = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%gradinit%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllKindergardensCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%gradinit%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

export default {
	getAll,
	getAllAlphabetical,
	getAllInstitutionsFromCountyId,
	getAllWithRating,
	getAllWithCountyName,
	getAllKindergardens,
	getAllKindergardensCount,
	searchForInstitution,
	searchForInstitutionWithCountyName
};
