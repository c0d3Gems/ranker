import pg from 'pg';
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const getAll = async (query) => {
	query = query.split(' ').join('').split('').join('%');
	const sql = `select institutii.id, institutii.denumire as "institutie", institutii.id_judet, judete.denumire as "judet" from institutii join judete on institutii.id_judet = judete.id where unaccent(institutii.denumire) ilike unaccent('%${query}%') limit 20;`;
	const result = await pool.query(sql);
	return result?.rows;
};

export default { getAll };
