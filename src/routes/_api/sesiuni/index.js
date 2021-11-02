import pg from 'pg';
// import dotenv from 'dotenv';
// dotenv.config();
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const check = async (params) => {
	const { authorization } = params;
	if (authorization) {
		const sessionId = authorization.split('-')[0];
		const userId = authorization.split('-')[1];
		const token = authorization.split('-')[2];

		const sql = `select id from sessions where id = '${sessionId}' and id_utilizator = '${userId}' and token = '${token}' ;`;
		const result = await pool.query(sql);

		if (result.rowCount === 1) {
			return true;
		} else return false;
	} else {
		return false;
	}
};

const remove = async (header) => {
	const { authorization } = params;
	if (authorization) {
		const id = authorization.split('-')[0];
		const userId = authorization.split('-')[1];
		const token = authorization.split('-')[2];
		const sql = `delete from sessions where id = '${id}' and id_utilizator = '${userId}' and token = '${token}' ;`;
		const result = await pool.query(sql);
		console.log('result', result);
		return {
			status: 'ok',
			message: 'session_deleted_successfully'
		};
	} else {
		return {
			status: 'error',
			message: 'authorization_header_missing'
		};
	}
};

export default {
	check,
	remove
};
