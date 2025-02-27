# from core.models import Contact, OurAddress
# from django.test import TestCase

# class ContactModelTest(TestCase):

#     @classmethod
#     def setUpClass(cls):
#         super().setUpClass()  # Veritabanı erişimini sağlamak için eklenmeli
#         cls.data = {
#             'name': 'John',
#             'email': 'john@gmail.com',
#             'subject': 'test',
#             'message': 'message',
#             'phone': '0123456',
#         }
#         cls.contact = Contact.objects.create(**cls.data)

#     def test_create_model(self):
#         contact = Contact.objects.first()
#         self.assertEqual(self.contact, contact)

#     @classmethod
#     def tearDownClass(cls):
#         super().tearDownClass()  # Veritabanı temizliği için eklenmeli



# class OurAddressModelTest(TestCase):

#     @classmethod
#     def setUpClass(cls):
#         super().setUpClass()  # Veritabanı erişimini sağlamak için eklenmeli
#         cls.data = {
#             'email': 'john@gmail.com',
#             'small_description': 'test',
#             'address': 'message',
#             'phone': '0123456',
#         }
#         cls.ouraddress = OurAddress.objects.create(**cls.data)

#     def test_create_model(self):
#         ouraddress = OurAddress.objects.first()
#         self.assertEqual(self.ouraddress, ouraddress)

#     @classmethod
#     def tearDownClass(cls):
#         super().tearDownClass()  # Veritabanı temizliği için eklenmeli        
