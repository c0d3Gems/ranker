import jwt_decode from 'jwt-decode';
import pg from 'pg';
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const googleAuth = async (params) => {
	const { credentials } = params;
	if (credentials) {
		const responsePayload = await jwt_decode(credentials);
		console.log(responsePayload);
		// console.log('ID: ' + responsePayload.sub);
		// console.log('Full Name: ' + responsePayload.name);
		// console.log('Given Name: ' + responsePayload.given_name);
		// console.log('Family Name: ' + responsePayload.family_name);
		// console.log('Image URL: ' + responsePayload.picture);
		// console.log('Email: ' + responsePayload.email);
		// check if exists
		const existsSql = `select id from utilizatori where google_id = '${responsePayload.sub}';`;
		const existsUser = await pool.query(existsSql);
		if (existsUser?.rowCount > 0) {
			// exists
		} else {
			const sql = `insert into utilizatori(google_id, prenume, nume, profile_pic_url, email) values('${responsePayload.sub}', '${responsePayload.given_name}', '${responsePayload.family_name}', '${responsePayload.picture}', '${responsePayload.email}');`;
			const query = await pool.query(sql);
		}
		return {
			status: 'ok',
			message: 'google_auth_successful'
		};
	}
};

export default {
	googleAuth
};
