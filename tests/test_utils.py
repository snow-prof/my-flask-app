from app.utils import is_positive


def test_positive_number():
    assert is_positive(10) is True


def test_negative_number():
    assert is_positive(-5) is False
    