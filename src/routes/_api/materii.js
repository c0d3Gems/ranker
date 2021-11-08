import pg from 'pg';
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const getAll = async () => {
	const sql = `select * from materii;`;
	const materii = await pool.query(sql);
	return materii.rows;
};

export default {
	getAll
};
