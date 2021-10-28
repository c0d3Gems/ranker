import Auth from '../../_api/auth';

export async function del(request) {
	const { authorization } = request?.headers;
	console.log('logging out', authorization);
	const result = await Auth.logout({ authorization });
	return {
		body: JSON.stringify(result)
	};
}
