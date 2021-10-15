import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const { id } = params;
	const result = await Institutii.getInstitutionById(id);
	return {
		body: JSON.stringify(result)
	};
}
