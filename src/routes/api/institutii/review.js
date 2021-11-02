import Recenzii from '../../_api/recenzii/institutii';
export async function post(req) {
	const { authorization } = req?.headers;
	const body = req?.body;
	const result = await Recenzii.create({ authorization, body });
	return {
		body: JSON.stringify(result)
	};
}
export async function del(req) {
	const headers = req?.headers;
	const body = req?.body;
	return {
		body: JSON.stringify({})
	};
}
