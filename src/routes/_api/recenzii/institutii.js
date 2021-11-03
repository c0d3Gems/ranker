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
	const {
		userId,
		institutionId,
		ownRatingConditions,
		ownRatingFeatures,
		ownRatingEquipment,
		ownRatingUtilities,
		ownRatingText
	} = body;
	if (
		userId &&
		institutionId &&
		ownRatingConditions &&
		ownRatingFeatures &&
		ownRatingEquipment &&
		ownRatingUtilities &&
		ownRatingText
	) {
		if (validSession) {
			// check existing
			const sql1 = `select id from rating_institutii where id_institutie = '${institutionId}' and id_utilizator = '${userId}' ;`;
			const exists = await pool.query(sql1);
			if (exists.rowCount === 1) {
				return {
					status: 'error',
					message: 'attempt_to_duplicate_rating'
				};
			} else {
				const sql = `insert into rating_institutii(
			id_utilizator,
			id_institutie,
			nota_conditii,
			nota_facilitati,
			nota_dotari,
			nota_utilitati,
			text
		)
		VALUES (
			'${userId}',
			'${institutionId}', 
			'${ownRatingConditions}', 
			'${ownRatingFeatures}', 
			'${ownRatingEquipment}',
			'${ownRatingUtilities}',
			'${ownRatingText}' 
		);`;
				const result = await pool.query(sql);
				return {
					status: 'ok',
					message: 'review_created_successfully'
				};
			}
		}
	} else {
		return {
			status: 'error',
			message: 'missing_parameters'
		};
	}
};

const remove = async (authorization, body) => {
	const validSession = await Sesiuni.check({ authorization });
	if (validSession) {
		const sql = `delete from rating_institutii where id = '${body?.reviewId}' and id_institutie = '${body?.institutionId}';`;
	}
};

const getAll = async (institutionId) => {
	if (institutionId) {
		const sql = `select * from rating_institutii where id >= 0 and id_institutie = '${institutionId}' ;`;
		const result = await pool.query(sql);
		return {
			status: 'ok',
			payload: result?.rows
		};
	}
};

const getAveragesOf = async (insArr) => {
	const institutions = insArr.map(async (ins, i) => {
		const facilitiesSQL = `select avg(nota_facilitati)::numeric(10, 2) from rating_institutii where id_institutie = '${ins?.id}';`;
		const conditionsSQL = `select avg(nota_conditii)::numeric(10, 2) from rating_institutii where id_institutie = '${ins?.id}';`;
		const equipmentSQL = `select avg(nota_dotari)::numeric(10, 2) from rating_institutii where id_institutie = '${ins?.id}';`;
		const utilitiesSQL = `select avg(nota_utilitati)::numeric(10, 2) from rating_institutii where id_institutie = '${ins?.id}';`;

		const facilitiesAvg = await pool.query(facilitiesSQL);
		const conditionsAvg = await pool.query(conditionsSQL);
		const equipmentAvg = await pool.query(equipmentSQL);
		const utilitiesAvg = await pool.query(utilitiesSQL);

		const totalAverage = Number(
			(Number(facilitiesAvg?.rows[0]?.avg) +
				Number(conditionsAvg?.rows[0]?.avg) +
				Number(equipmentAvg?.rows[0]?.avg) +
				Number(utilitiesAvg?.rows[0]?.avg)) /
				4
		);
		return {
			...ins,
			facilitiesAvg: Number(facilitiesAvg?.rows[0]?.avg),
			conditionsAvg: Number(conditionsAvg?.rows[0]?.avg),
			equipmentAvg: Number(equipmentAvg?.rows[0]?.avg),
			utilitiesAvg: Number(utilitiesAvg?.rows[0]?.avg),
			totalAverage: Number(totalAverage)
		};
	});
	const finalInst = await Promise.all(institutions);
	return finalInst;
};

export default {
	create,
	remove,
	getAll,
	getAveragesOf
};
