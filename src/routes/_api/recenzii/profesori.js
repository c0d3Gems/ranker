import Sesiuni from '../sesiuni';
import pg from 'pg';
// import dotenv from 'dotenv';
// dotenv.config();
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const create = async ({ authorization, body }) => {
	const validSession = await Sesiuni.check({ authorization });
	if (validSession) {
		const { nume, idInstitutieActiv, pensionat, tip } = body;
		const sql = `insert into profesori(nume, id_institutie_activ, pensionat, tip) values('${nume}', ${idInstitutieActiv}, ${
			false || pensionat
		}, ${tip})`;
		const result = await pool.query(sql);
		return {
			status: 'ok',
			message: 'added_successfully'
		};
	} else {
		return {
			status: 'error',
			message: 'could_not_add'
		};
	}
};

const remove = async ({ authorization, body }) => {
	const validSession = await Sesiuni.check({ authorization });
	if (validSession) {
		const { profesorId } = body;
		const sql = `delete from profesori where profesori.id = ${profesorId}`;
		const result = await pool.query(sql);
		return {
			status: 'ok',
			message: 'successfully_blacklisted'
		};
	} else {
		return {
			status: 'error',
			message: 'removed_successfully'
		};
	}
};

const blacklist = async ({ authorization, body }) => {
	const validSession = await Sesiuni.check({ authorization });
	if (validSession) {
		const { profesorId } = body;
		const sql = `insert into lista_neagra(id_profesor, text) values('${profesorId}', '${
			text || ''
		}')`;
		const result = await pool.query(sql);
		return {
			status: 'ok',
			message: 'successfully_blacklisted'
		};
	} else {
		return {
			status: 'error',
			message: 'removed_successfully'
		};
	}
};

export default {
	create,
	remove,
	blacklist
};
