void main() {
    print("Tipos de Variables en Dart");
    final String pokemon = "Ditto";
    print(pokemon);
    String myName = 'Francisco';
    myName = "Higuera";
    print(myName);
    const String elemento = "Fuego";
    print("elemento: $elemento");
    bool active = false;
    active = false;
    print("Es activo: $active");
    int hp = 1000;
    print("caballos de Fuerza");
    List<String> abilites=["impostor", "correlón"];
    print("habilidades $abilites");
    final sprites = <String>["src/image1.jpg", "image2"];
    print("Images $sprites");
    
    print("Impresion en varias lineas");
    print("""
    $pokemon
    $hp
    $sprites
    $abilites""");
}