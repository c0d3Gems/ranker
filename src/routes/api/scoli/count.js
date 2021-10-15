import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const result = await Institutii.getAllSchoolsCount();
	return {
		body: JSON.stringify(result)
	};
}
