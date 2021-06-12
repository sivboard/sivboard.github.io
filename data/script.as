void Main()
{
  Font font(60, FileSystem::SpecialFolderPath(SpecialFolder::SystemFonts) + "arial.ttf");
  while (System::Update())
  {
    font("Hello, SivBoard!🐣").drawAt(Scene::Center(), Palette::White);
  }
}
