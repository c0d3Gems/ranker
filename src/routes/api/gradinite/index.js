import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const { offset } = params;
	const result = await Institutii.getAllKindergardens(offset);
	return {
		body: JSON.stringify(result)
	};
}
