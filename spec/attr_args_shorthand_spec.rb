require "spec_helper"

describe "AttrArgsShorthand" do
  let!(:test_object_level_1) { TestObjectLevel.new(arg1: 'test1', arg2: 'test2') }
  let!(:test_object_level_2) { TestObjectLevel.new(arg3: 'test3', arg4: 'test4') }

  let!(:test_class_level_1) { TestClassLevel.new(arg1: 'test1', arg2: 'test2') }
  let!(:test_class_level_2) { TestClassLevel.new(arg3: 'test3', arg4: 'test4') }

  it "sets variables" do
    expect(test_object_level_1.instance_variable_get(:@arg1)).to eq 'test1'
  end

  it "reads variables through methods" do
    expect(test_object_level_1.arg1).to eq "test1"
    expect(test_object_level_1.arg2).to eq "test2"

    expect(test_object_level_2.arg3).to eq "test3"
    expect(test_object_level_2.arg4).to eq "special4"
  end

  it "doesnt define methods on other objects" do
    expect { test_object_level_1.arg3 }.to raise_error(NoMethodError)
  end

  it "sets writer methods" do
    test_object_level_1.arg1 = "test11"
    expect(test_object_level_1.arg1).to eq "test11"
    expect(test_object_level_1.instance_variable_get(:@arg1)).to eq "test11"
    expect { test_object_level_2.arg1 = "test11" }.to raise_error(NoMethodError)
  end

  it "doesnt overwrite defined methods" do
    expect(test_object_level_1.arg4).to eq "special4"
    test_object_level_1.arg4 = "wee4"
    expect(test_object_level_1.arg4).to eq "special4"
    expect(test_object_level_1.instance_variable_get(:@arg4)).to eq "something4"
  end
end
