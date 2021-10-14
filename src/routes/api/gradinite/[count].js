import Institutii from '../../_api/institutii/Institutii';

export async function get({ params }) {
	const { count } = params;
	const result = await Institutii.getAllKindergardensCount(count);
	return {
		body: JSON.stringify(result)
	};
}
