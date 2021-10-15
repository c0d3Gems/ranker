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

const getAllSchools = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%scoal%') and unaccent(institutii.denumire) not ilike unaccent('%postlic%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllColleges = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%colegiul%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllHighschools = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%liceu%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllProfessionalSchools = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%postlic%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllUniversities = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%universi%') limit 30 ${
		offset ? `offset ${offset * 30}` : ''
	};`;
	const result = await pool.query(sql);
	return result.rows;
};

const getAllAcademies = async (offset) => {
	const sql = `select institutii.id, institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('academ%') limit 30 ${
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

const getAllSchoolsCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%scoal%') and unaccent(institutii.denumire) not ilike unaccent('%postlic%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getAllCollegesCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%colegiul%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getAllHighschoolsCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%liceu%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getAllUniversitiesCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%universi%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getAllAcademiesCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('academ%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getAllProfessionalSchoolsCount = async () => {
	const sql = `select count(1) from institutii where unaccent(institutii.denumire) ilike unaccent('%postlic%');`;
	const result = await pool.query(sql);
	return result?.rows[0];
};

const getInstitutionById = async (id) => {
	const sql = `select institutii.id as "id", institutii.denumire as "institutie", judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where institutii.id = ${id};`;
	const result = await pool.query(sql);
	return result?.rows;
};

export default {
	getAll,
	getAllAlphabetical,
	getAllInstitutionsFromCountyId,
	getAllWithRating,
	getAllWithCountyName,
	getAllKindergardens,
	getAllKindergardensCount,
	getAllSchools,
	getAllSchoolsCount,
	getAllColleges,
	getAllCollegesCount,
	getAllHighschools,
	getAllHighschoolsCount,
	getAllProfessionalSchools,
	getAllProfessionalSchoolsCount,
	getAllUniversities,
	getAllUniversitiesCount,
	getAllAcademies,
	getAllAcademiesCount,
	getInstitutionById,
	searchForInstitution,
	searchForInstitutionWithCountyName
};
