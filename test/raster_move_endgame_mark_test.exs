defmodule RasterMoveEndgameMarkTest do
  use ExUnit.Case

  test "fixture decisions" do
    signal_case_1 = %{demand: 55, capacity: 78, latency: 10, risk: 20, weight: 5}
    assert RasterMoveEndgameMark.score(signal_case_1) == 33
    assert RasterMoveEndgameMark.classify(signal_case_1) == "review"
    signal_case_2 = %{demand: 65, capacity: 99, latency: 22, risk: 5, weight: 7}
    assert RasterMoveEndgameMark.score(signal_case_2) == 149
    assert RasterMoveEndgameMark.classify(signal_case_2) == "review"
    signal_case_3 = %{demand: 105, capacity: 88, latency: 11, risk: 19, weight: 4}
    assert RasterMoveEndgameMark.score(signal_case_3) == 144
    assert RasterMoveEndgameMark.classify(signal_case_3) == "review"
  end
end
