package de.autohutt.domain
class FahrzeugMarke implements java.io.Serializable
{
	String name

	static mapping =
	{
		cache true
  	}

	public String toString()
	{
		return name;
	}
}
