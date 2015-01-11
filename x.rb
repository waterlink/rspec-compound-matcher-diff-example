RSpec::Matchers.define_negated_matcher :exclude, :include

RSpec.describe "Combining include and exclude" do
  let(:multiline_string) do
    <<-EOS
    Foo 1
    Bar 2
    Bazz 3
    EOS
  end

  example "include().and exclude()" do
    expect(multiline_string).to include("    Bar 3").and exclude("    Bar 4")
  end

  example "include().or exclude()" do
    expect(multiline_string).to include("    Bar 5").or exclude("    Bazz 3")
  end

  example "include().or exclude().and include()" do
    expect(multiline_string).to include("    Bar 5").or exclude("    Bazz 3").and include("    Foo 5")
  end

  example "separate expectations" do
    expect(multiline_string).to include("    Bar 3")
    expect(multiline_string).to exclude("    Bar 4")
  end
end
