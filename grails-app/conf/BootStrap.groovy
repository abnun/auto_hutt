import de.webmpuls.photo_album.Album

class BootStrap
{

	def init =
	{
		servletContext ->

		// Foto-Alben

		Album neuwagen = Album.findByName("neuwagen")
		if(!neuwagen)
		{
			neuwagen = new Album(name: "neuwagen", description: "Foto-Album für Neuwagen")
			neuwagen.save()
		}

		Album gebrauchtwagen = Album.findByName("gebrauchtwagen")
		if(!gebrauchtwagen)
		{
			gebrauchtwagen = new Album(name: "gebrauchtwagen", description: "Foto-Album für Gebrauchtwagen")
			gebrauchtwagen.save()
		}
	}

	def destroy =
	{
	}
} 