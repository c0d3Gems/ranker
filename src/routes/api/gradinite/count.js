import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const result = await Institutii.getAllKindergardensCount();
	return {
		body: JSON.stringify(result)
	};
}
