import Institutii from './Institutii.js';

export async function get({ params }) {
	const institutii = await Institutii.getAll();
	return {
		body: JSON.stringify(institutii)
	};
}
