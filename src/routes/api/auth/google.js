import Auth from '../../_api/auth';

export async function post({ params }) {
	const { body } = params;
	const result = await Auth.googleAuth(params);
	console.log(params, result);
	return {
		body: JSON.stringify(result)
	};
}
