from django.test import TestCase
from django.urls import reverse_lazy


class ContactViewTest(TestCase):

    @classmethod
    def setUpClass(cls) -> None:
        return super().setUpClass()
    
    def test_url(self):
        self.url = reverse_lazy('core:contact_us')
        self.assertEqual(self.url, '/en/core/contact/')
    
    @classmethod
    def tearDownClass(cls) -> None:
        pass

class AboutUsViewTest(TestCase):
     
     @classmethod
     def setUpClass(cls) -> None:
        return super().setUpClass()
     
     def test_url(self):
        self.url = reverse_lazy('core:about_us')
        self.assertEqual(self.url, '/en/core/about-us/')
        
     @classmethod
     def tearDownClass(cls) -> None:
        pass
