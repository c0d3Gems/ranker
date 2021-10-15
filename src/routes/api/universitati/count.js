import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const result = await Institutii.getAllUniversitiesCount();
	return {
		body: JSON.stringify(result)
	};
}
