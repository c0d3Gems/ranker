import cryptoRandomString from 'crypto-random-string';
import pg from 'pg';
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const create = async (params) => {
	const { userId } = params;
	const sessionToken = cryptoRandomString({ length: 32 });
	const sql = `insert into sessions(id_utilizator, token) values ('${userId}', '${sessionToken}') returning id;`;
	const query = await pool.query(sql);
	const sessionId = query?.rows[0]?.id;
	return {
		status: 'ok',
		payload: `${sessionId}-${userId}-${sessionToken}`
	};
};

const validate = async (params) => {
	const { session } = params;
	const sessionId = session.split('-')[0];
	const userId = session.split('-')[1];
	const sessionToken = session.split('-')[2];
	const sql = `select * from sessions where id = '${sessionId}' and token = '${sessionToken}' and id_utilizator = '${userId}';`;
	const result = await pool.query(sql);
	if (result.rowCount > 0) {
		return {
			status: 'ok',
			message: 'valid_session'
		};
	} else {
		return {
			status: 'error',
			message: 'invalid_session'
		};
	}
};

export default {
	create,
	validate
};
